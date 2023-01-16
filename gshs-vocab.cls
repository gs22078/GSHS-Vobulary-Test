% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % % LaTeX document class for the GSHS Vocabulary Test % % %
% % % First edition 2022.11.19 by Junseok Lee % % % % % % % %
% % % Copyright (C) 2022-present GSHS TeX Society % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gshs-vocab}[2022/11/19 GSHS English Vocabulary Test (Day 21-28, 39-50)]
\LoadClass[10pt]{article}
\RequirePackage{lipsum}
\RequirePackage{kotex}
\RequirePackage{enumitem}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{stackengine}
\RequirePackage{fancyhdr}
\RequirePackage{tcolorbox}
\RequirePackage{textcomp}
\RequirePackage{multicol}
\RequirePackage[T1]{fontenc}
\RequirePackage[a4paper,left=30mm,right=30mm,top=28mm,bottom=20mm,headheight=14pt]{geometry}
\renewcommand\day{0}
\renewcommand\u[1]{\stackengine{0pt}{\underline{\qquad\qquad\qquad\vphantom{#1}}}{#1}{O}{c}{F}{F}{L}}
\newcommand\un[1]{\stackengine{0pt}{\underline{\qquad\qquad\qquad\vphantom{#1}}}{#1}{O}{l}{F}{F}{L}}

%\pagestyle{fancy}
\fancypagestyle{test}{%
\renewcommand{\headrulewidth}{0pt}
\fancyhf{}\fancyhead[C]{\large 경기과고 영어 단어 시험}
\fancyhead[R]{이름:~\u{}}
\fancyfoot[C]{\thepage}
}
\fancypagestyle{answer}{%
\renewcommand{\headrulewidth}{0pt}
\fancyhf{}
\fancyhead[C]{\large 경기과고 영어 단어 시험 정답}
\fancyhead[R]{점수:\qquad}
\fancyfoot[C]{\thepage}
}
\fancypagestyle{study}{%
\renewcommand{\headrulewidth}{0.4pt}
	\fancyhf{}
	\fancyhead[R]{\day}
	\fancyfoot[C]{\thepage}
}
\setlength{\parskip}{0pt}
\setlength{\itemsep}{0pt plus 1pt}
\newcommand\cfbox{\fcolorbox{black}{lightgray}}
\newcommand\gfbox[2]{\fcolorbox{#2}{#2!10!white}{#1}\renewcommand{\day}{#1}}
\setlength{\parindent}{0pt}
\ExplSyntaxOn
\seq_new:N \l_my_seq
\seq_new:N \l_vocab_seq
\seq_new:N \l_en_seq
\seq_new:N \l_kor_seq
\seq_new:N \l_pen_seq
\seq_new:N \l_pkor_seq
\seq_new:N \l_pensen_seq
\seq_new:N \l_pensenans_seq
\seq_new:N \l_pkorsen_seq
\int_new:N \l_pdiff_int
\seq_new:N \l_ppensen_seq
\seq_new:N \l_ppensenans_seq
\seq_new:N \l_ppkorsen_seq
\int_new:N \l_ppdiff_int
\seq_new:N \l_study_seq
\tl_new:N \l_rangein_tl
\tl_new:N \l_pitems_tl
\tl_new:N \l_items_tl
\tl_new:N \l_my_tl
\tl_new:N \l_en_tl
\tl_new:N \l_word_tl
\tl_new:N \l_start_tl
\tl_new:N \l_end_tl
\int_new:N \l_taskno_int
\int_new:N \l_tnum_int
\int_new:N \l_tempnum_int
\clist_new:N \l_colorlist_clist
\clist_set:Nn \l_colorlist_clist {ForestGreen, RoyalBlue, Magenta}
\clist_new:N \l_study_clist
\clist_new:N \l_exam_clist
\clist_new:N \l_one_clist
\clist_new:N \l_two_clist
\clist_new:N \l_three_clist
\clist_new:N \l_range_clist
\clist_new:N \g_rangelist_clist
\int_new:N \l_day_int
\int_new:N \l_num_int
\int_new:N \l_colnum_int
\int_new:N \l_daynum_int
\ior_new:N \g_vocab_readfile_stream
\ior_open:Nn \g_vocab_readfile_stream { vocab.dat }
\ior_map_inline:Nn \g_vocab_readfile_stream
{ \seq_gput_right:Nn \l_vocab_seq { #1 } }
\seq_new:N \l_daytoindex_seq
\int_step_inline:nnn {1}{50} {
	\seq_push:Nn \l_daytoindex_seq {0}
}
\int_step_inline:nnn {21}{28} {
	\seq_set_item:Nnn \l_daytoindex_seq {#1} {\int_eval:n {#1 - 20} }
}
\int_step_inline:nnn {39}{50} {
	\seq_set_item:Nnn \l_daytoindex_seq {#1} {\int_eval:n {#1 - 30} }
}

\cs_new:Npn \fn_range:n #1 {
    \clist_gset:Nn \l_range_clist { #1 }
    \clist_map_inline:Nn \l_range_clist {
        \tl_set:Nn \l_my_tl { ##1 }
        \tl_if_in:NnTF \l_my_tl { - } {
        	\tl_set_eq:NN \l_start_tl \l_my_tl
        	\tl_set_eq:NN \l_end_tl \l_my_tl
        	\regex_replace_once:nnN { (.*)-(.*) } { \1 } \l_start_tl
        	\regex_replace_once:nnN { (.*)-(.*) } { \2 } \l_end_tl
            \fn_put_range:n { \l_start_tl } { \l_end_tl }
		} {
			\int_compare:nTF { 20 < \l_my_tl < 29 } { \clist_gpush:Nx \g_rangelist_clist { \int_eval:n { \l_my_tl - 20 } } } { }
			\int_compare:nTF { 38 < \l_my_tl < 51 } { \clist_gpush:Nx \g_rangelist_clist { \int_eval:n { \l_my_tl - 30 } } } { }
        }
    }
    \clist_gremove_duplicates:N \g_rangelist_clist
    \clist_gsort:Nn \g_rangelist_clist { \int_compare:nNnTF {##1} > {##2} { \sort_return_swapped: } { \sort_return_same: }}
}

\cs_new:Npn \fn_put_range:n #1 #2 {
	\int_step_inline:nnn {#1}{#2} {
		\int_compare:nTF { 20 < ##1 < 29 } { \clist_gpush:Nx \g_rangelist_clist { \int_eval:n { ##1 - 20 } } } { }
		\int_compare:nTF { 38 < ##1 < 51 } { \clist_gpush:Nx \g_rangelist_clist { \int_eval:n { ##1 - 30 } } } { }
	}
}

\NewDocumentCommand{\study}{ O{21-50} }{
	\pagestyle{study}
	\int_gset:Nn \l_colnum_int {1}
	\clist_gclear:N \g_rangelist_clist
	\fn_range:n {#1}
	\clist_set_eq:NN \l_study_clist \g_rangelist_clist
	%\clist_use:Nn \l_study_clist {~and~}\newline
	\clist_map_inline:Nn \l_study_clist {
		\fn_studyday:n {##1}
	}
}

\clist_set:Nn \l_daynum_clist {21,22,23,24,25,26,27,28,39,40,41,42,43,44,45,46,47,48,49,50}
\cs_new:Npn \fn_studyday:n #1{
\tl_set:Nn \l_color_tl {\clist_item:Nn \l_colorlist_clist {\int_eval:n {\int_mod:nn {\l_colnum_int}{3} + 1}}}
\gfbox{Day~\clist_item:Nn \l_daynum_clist {#1}}{\tl_use:N \l_color_tl} \newline
\int_set:Nn \l_num_int {1}
\int_step_inline:nnn {#1 * 30 - 29} {#1 * 30} {
	\tl_set:Nf {\l_my_tl} {\seq_item:Nn \l_vocab_seq {##1}}
	\tl_set_eq:NN \l_word_tl \l_my_tl
	\regex_replace_once:nnN { (.*?)/(.*?)/(.*?)\((\w+)\)(.*?)/(.*) } { \1\c{qquad}\2\c{tcblower}\3\c{textcolor}\cB{red\cE}\cB{\4\cE}\5\c{newline}\6} \l_my_tl
	\regex_replace_once:nnN { (.*?)/.* } { \1 } \l_word_tl
	\begin{tcolorbox}[colback=
	\tl_use:N \l_color_tl !5!white,colframe=\tl_use:N \l_color_tl,colbacktitle=\tl_use:N \l_color_tl,title={\bfseries \int_use:N \l_num_int\ \tl_use:N \l_word_tl}]
	\l_my_tl
	\end{tcolorbox}
	\int_incr:N \l_num_int
}
\int_gincr:N \l_colnum_int
\newpage
}
\cs_new:Npn \fn_pushday:n #1 {
	\int_step_inline:nnn {#1 * 30 - 29} {#1 * 30} {
		\seq_push:Nx \l_my_seq {\seq_item:Nn \l_vocab_seq {##1}}
	}
}
\NewDocumentCommand{\test}{ O{} } {%
\thispagestyle{test}
	\clist_gclear:N \g_rangelist_clist
	\fn_range:n {#1}
	\clist_set_eq:NN \l_test_clist \g_rangelist_clist
	\clist_if_empty:NTF \l_test_clist
	{
		\seq_set_eq:NN \l_my_seq \l_vocab_seq
		\raisebox{2em}{\small 범위:~Day~전체(21-28,~39-50)}\vspace*{-2em}
	}
	{
		\clist_map_inline:Nn \l_test_clist {
			\fn_pushday:n {##1}
		}
		\raisebox{2em}{\small 범위:~Day~#1 }\vspace*{-2em}
	}
\int_set:Nn \l_pdiff_int {0}
\int_set:Nn \l_ppdiff_int {0}
\seq_shuffle:N \l_my_seq
\int_set:Nn \l_tmpa_int { 1 }
\int_do_while:nn { \l_tmpa_int < 7 }
{
	\seq_pop_left:NN {\l_my_seq} {\l_my_tl}
	\tl_set_eq:NN \l_en_tl \l_my_tl
	\regex_replace_once:nnN { (.*?)/(.*?)/(.*?)/(.*) } { \1 } \l_en_tl
	\regex_replace_once:nnN { (.*?)/(.*?)/(.*?)/(.*) } { \2 } \l_my_tl
	\seq_push:Nx \l_en_seq \l_en_tl
	\seq_push:Nx \l_kor_seq \l_my_tl
	\int_incr:N \l_tmpa_int
}
\tl_set:Nn \l_tablines_tl { \hfill \seq_item:Nn \l_en_seq {1} \hfill\null \c_alignment_token \hfill \seq_item:Nn \l_en_seq {2}\hfill\null \c_alignment_token \hfill \seq_item:Nn \l_en_seq {3}\hfill\null \tabularnewline }
\tl_put_right:Nn \l_tablines_tl { \hfill \seq_item:Nn \l_en_seq {4}\hfill\null \c_alignment_token \hfill \seq_item:Nn \l_en_seq {5}\hfill\null \c_alignment_token \hfill \seq_item:Nn \l_en_seq {6}\hfill\null \tabularnewline }
\seq_set_from_clist:Nn \l_one_seq {1,2,3,4,5,6}
\seq_shuffle:N \l_one_seq

\int_set:Nn \l_tmpa_int {1}
\int_do_while:nn { \l_tmpa_int < 7 }
{
	\seq_pop_left:NN {\l_my_seq} {\l_my_tl}
	\tl_set_eq:NN \l_en_tl \l_my_tl
	\tl_set_eq:NN \l_kor_tl \l_my_tl
	\tl_set_eq:NN \l_ensen_tl \l_my_tl
	\tl_set_eq:NN \l_korsen_tl \l_my_tl
	\regex_replace_once:nnN { (.*?)/(.*?)/(.*?)/(.*) } { \1 } \l_en_tl
	\regex_replace_once:nnN { (.*?)/(.*?)/(.*?)/(.*) } { \2 } \l_kor_tl
	\regex_replace_once:nnN { (.*?)/(.*?)/(.*?)/(.*) } { \3 } \l_ensen_tl
	\regex_replace_once:nnN { (.*?)/(.*?)/(.*?)/(.*) } { \4 } \l_korsen_tl
	\tl_set_eq:NN \l_ensenprob_tl \l_ensen_tl
	\tl_set_eq:NN \l_enword_tl \l_ensen_tl
	\regex_replace_once:nnN { \(\w+\) } { \c{u} \cB{ \cE} } \l_ensenprob_tl
	\regex_replace_once:nnN { \((\w+)\) } { \c{u} \cB{ \c{textcolor} \cB{ red \cE} \cB{ \1 \cE} \cE} } \l_ensen_tl
	\regex_replace_once:nnN { .*\((\w+)\).* } { \1 } \l_enword_tl
	\tl_set_eq:NN \l_denword_tl \l_enword_tl
	\tl_set_eq:NN \l_den_tl \l_en_tl
	\regex_replace_once:nnN { \w } { } \l_denword_tl
	\regex_replace_once:nnN { \w } { } \l_den_tl
	\tl_if_eq:NNTF \l_denword_tl \l_den_tl { } { \int_incr:N \l_pdiff_int }
	\seq_push:No \l_pen_seq \l_en_tl
	\seq_push:No \l_pensenans_seq \l_ensen_tl
	\seq_push:No \l_pensen_seq \l_ensenprob_tl
	\seq_push:Nx \l_pkorsen_seq \l_korsen_tl
	\int_incr:N \l_tmpa_int
}
\tl_set:Nn \l_ptablines_tl { \hfill \seq_item:Nn \l_pen_seq {1} \hfill\null \c_alignment_token \hfill \seq_item:Nn \l_pen_seq {2}\hfill\null \c_alignment_token \hfill \seq_item:Nn \l_pen_seq {3}\hfill\null \tabularnewline }
\tl_put_right:Nn \l_ptablines_tl { \hfill \seq_item:Nn \l_pen_seq {4}\hfill\null \c_alignment_token \hfill \seq_item:Nn \l_pen_seq {5}\hfill\null \c_alignment_token \hfill \seq_item:Nn \l_pen_seq {6}\hfill\null \tabularnewline }
\seq_set_from_clist:Nn \l_two_seq {1,2,3,4,5,6}
\seq_shuffle:N \l_two_seq


\int_set:Nn \l_tmpa_int {1}
\int_do_while:nn { \l_tmpa_int < 9 }
{
	\seq_pop_left:NN {\l_my_seq} {\l_my_tl}
	\tl_set_eq:NN \l_en_tl \l_my_tl
	\tl_set_eq:NN \l_kor_tl \l_my_tl
	\tl_set_eq:NN \l_ensen_tl \l_my_tl
	\tl_set_eq:NN \l_korsen_tl \l_my_tl
	\regex_replace_once:nnN { (.*?)/(.*?)/(.*?)/(.*) } { \1 } \l_en_tl
	\regex_replace_once:nnN { (.*?)/(.*?)/(.*?)/(.*) } { \2 } \l_kor_tl
	\regex_replace_once:nnN { (.*?)/(.*?)/(.*?)/(.*) } { \3 } \l_ensen_tl
	\regex_replace_once:nnN { (.*?)/(.*?)/(.*?)/(.*) } { \4 } \l_korsen_tl
	\tl_set_eq:NN \l_ensenprob_tl \l_ensen_tl
	\tl_set_eq:NN \l_enword_tl \l_ensen_tl
	\regex_replace_once:nnN { \((\w)\w+\) } { \c{un} \cB{ \1 \cE} } \l_ensenprob_tl
	\regex_replace_once:nnN { \((\w)(\w+)\) } { \c{un} \cB{ \1 \c{textcolor} \cB{ red \cE} \cB{ \2 \cE} \cE} } \l_ensen_tl
	\regex_replace_once:nnN { .*\((\w+)\).* } { \1 } \l_enword_tl
	\tl_set_eq:NN \l_denword_tl \l_enword_tl
	\tl_set_eq:NN \l_den_tl \l_en_tl
	\regex_replace_once:nnN { \w } { } \l_denword_tl
	\regex_replace_once:nnN { \w } { } \l_den_tl
	\tl_if_eq:NNTF \l_denword_tl \l_den_tl { } { \int_incr:N \l_ppdiff_int }
	\seq_push:No \l_ppensenans_seq \l_ensen_tl
	\seq_push:No \l_ppensen_seq \l_ensenprob_tl
	\seq_push:Nx \l_ppkorsen_seq \l_korsen_tl
	\int_incr:N \l_tmpa_int
}
\seq_set_from_clist:Nn \l_three_seq {1,2,3,4,5,6,7,8}
\seq_shuffle:N \l_three_seq

\begin{enumerate}
	\bfseries
	\item[\cfbox{Task~1}] Fill~in~the~blanks~by~choosing~the~English~word~from~the~box~that~matches~its~Korean~meaning.
\end{enumerate}
\fbox{\begin{tabular}{p{.3\textwidth}p{.3\textwidth}p{.3\textwidth}}
	\tl_use:N \l_tablines_tl
\end{tabular}}
\begin{enumerate}[label=(\arabic*),itemsep=0pt,leftmargin=*,align=left]
\int_step_inline:nn { 6 } { \item \seq_item:Nn \l_kor_seq {\seq_item:Nn \l_one_seq { ##1 }}:\quad\u{} }
\end{enumerate}
\begin{enumerate}
	\bfseries
	\item[\cfbox{Task~2}] Choose~the~best~word~to~complete~each~sentence.~(Change~the~form~if~needed.)
\end{enumerate}
\fbox{\begin{tabular}{p{.3\textwidth}p{.3\textwidth}p{.3\textwidth}}
	\tl_use:N \l_ptablines_tl
\end{tabular}}\smallskip\par
*단어~중복~활용~불가능,~형태~변형~\int_use:N \l_pdiff_int 개.~(대소문자~구별~제외)
\begin{enumerate}[label=(\arabic*),itemsep=0pt,leftmargin=*,align=left]
\int_step_inline:nn { 6 } { \item \seq_item:Nn \l_pensen_seq {\seq_item:Nn \l_two_seq { ##1 }}}
\end{enumerate}
\begin{enumerate}
	\bfseries
	\item[\cfbox{Task~3}] Write~down~the~best~word~to~complete~each~sentence,~starting~with~the~given~letter.
\end{enumerate}
*형태~변형~\int_use:N \l_ppdiff_int 개.~(대소문자~구별~제외)
\begin{enumerate}[label=(\arabic*),itemsep=0pt,leftmargin=*,align=left]
\int_step_inline:nn { 8 } { \item \seq_item:Nn \l_ppensen_seq {\seq_item:Nn \l_three_seq { ##1 }}\newline\seq_item:Nn \l_ppkorsen_seq {\seq_item:Nn \l_three_seq { ##1 }}}
\end{enumerate}
\newpage
\thispagestyle{answer}
\begin{enumerate}
	\bfseries
	\item[\cfbox{Task~1}] Fill~in~the~blanks~by~choosing~the~English~word~from~the~box~that~matches~its~Korean~meaning.
\end{enumerate}
\fbox{\begin{tabular}{p{.3\textwidth}p{.3\textwidth}p{.3\textwidth}}
		\tl_use:N \l_tablines_tl
\end{tabular}}
\begin{enumerate}[label=(\arabic*),itemsep=0pt,leftmargin=*,align=left]
\int_step_inline:nn { 6 } { \item \seq_item:Nn \l_kor_seq {\seq_item:Nn \l_one_seq {##1}}: \quad\u{\textcolor{red}{\seq_item:Nn \l_en_seq {\seq_item:Nn \l_one_seq{##1}}}} }
\end{enumerate}
\begin{enumerate}
	\bfseries
	\item[\cfbox{Task~2}] Choose~the~best~word~to~complete~each~sentence.~(Change~the~form~if~needed.)
\end{enumerate}
\fbox{\begin{tabular}{p{.3\textwidth}p{.3\textwidth}p{.3\textwidth}}
	\tl_use:N \l_ptablines_tl
\end{tabular}}\smallskip\par
*단어~중복~활용~불가능,~형태~변형~\int_use:N \l_pdiff_int 개.~(대소문자~구별~제외)
\begin{enumerate}[label=(\arabic*),itemsep=0pt,leftmargin=*,align=left]
\int_step_inline:nn { 6 } { \item \seq_item:Nn \l_pensenans_seq {\seq_item:Nn \l_two_seq { ##1 }}\\\textcolor{red}{\seq_item:Nn \l_pkorsen_seq {\seq_item:Nn \l_two_seq { ##1 }}}}
\end{enumerate}
\begin{enumerate}
	\bfseries
	\item[\cfbox{Task~3}] Write~down~the~best~word~to~complete~each~sentence,~starting~with~the~given~letter.
\end{enumerate}
*형태~변형~\int_use:N \l_ppdiff_int 개.~(대소문자~구별~제외)
\begin{enumerate}[label=(\arabic*),itemsep=0pt,leftmargin=*,align=left]
\int_step_inline:nn { 8 } { \item \seq_item:Nn \l_ppensenans_seq {\seq_item:Nn \l_three_seq { ##1 }}\\\seq_item:Nn \l_ppkorsen_seq {\seq_item:Nn \l_three_seq { ##1 }}}
\end{enumerate}
}
\keys_define:nn { taskprob }
{
	task .int_set:N = \l_taskno_int,
	task .initial:n = 3,
    day .tl_set:N = \l_rangein_tl,
	day .initial:n = {},
    num .int_set:N = \l_tempnum_int,
	num .initial:n = 20,
}
\NewDocumentCommand{\task}{ O{} } {%
\thispagestyle{test}
	\clist_gclear:N \g_rangelist_clist
	\keys_set:nn { taskprob } { #1 }
	\fn_range:n {\l_rangein_tl}
	\clist_set_eq:NN \l_test_clist \g_rangelist_clist
	\clist_if_empty:NTF \l_test_clist
	{
		\seq_set_eq:NN \l_my_seq \l_vocab_seq
		\raisebox{2em}{\small 범위:~Day~전체(21-28,~39-50)}\vspace*{-2em}
	}
	{
		\clist_map_inline:Nn \l_test_clist {
			\fn_pushday:n {##1}
		}
		\raisebox{2em}{\small 범위:~Day~\l_rangein_tl }\vspace*{-2em}
	}
	\int_compare:nNnTF {\seq_count:N \l_my_seq} < {\l_tempnum_int} {\int_set:Nn \l_tnum_int {\seq_count:N \l_my_seq}} {\int_set:Nn \l_tnum_int {\l_tempnum_int}}
\int_set:Nn \l_pdiff_int {0}
\int_set:Nn \l_ppdiff_int {0}
\seq_shuffle:N \l_my_seq

\seq_clear:N \l_en_seq
\seq_clear:N \l_kor_seq
\seq_clear:N \l_pen_seq
\seq_clear:N \l_pensenans_seq
\seq_clear:N \l_pensen_seq
\seq_clear:N \l_pkorsen_seq
\clist_clear:N \l_one_clist
\clist_clear:N \l_two_clist
\clist_clear:N \l_three_clist

\int_case:nnT {\l_taskno_int}
{
	{1} {
\int_set:Nn \l_tmpa_int { 0 }
\int_do_while:nn { \l_tmpa_int < \l_tnum_int }
{
	\int_incr:N \l_tmpa_int
	\seq_pop_left:NN {\l_my_seq} {\l_my_tl}
	\tl_set_eq:NN \l_en_tl \l_my_tl
	\regex_replace_once:nnN { (.*?)/(.*?)/(.*?)/(.*) } { \1 } \l_en_tl
	\regex_replace_once:nnN { (.*?)/(.*?)/(.*?)/(.*) } { \2 } \l_my_tl
	\seq_push:Nx \l_en_seq \l_en_tl
	\seq_push:Nx \l_kor_seq \l_my_tl
}
\int_step_inline:nnn {1} {\l_tnum_int} {
	\clist_push:Nn \l_one_clist {##1}
}
\seq_set_from_clist:NN \l_one_seq \l_one_clist
\seq_shuffle:N \l_one_seq
\begin{enumerate}
	\bfseries
	\item[\cfbox{Task~1}] Fill~in~the~blanks~by~choosing~the~English~word~from~the~box~that~matches~its~Korean~meaning.
\end{enumerate}
\fbox{\begin{minipage}{\textwidth}\begin{multicols}{3}\begin{itemize}[label={}]
\seq_map_inline:Nn \l_en_seq { \item ##1 }
\end{itemize}\end{multicols}\vspace*{-0.8em}\end{minipage}}\smallskip\par
\begin{enumerate}[label=(\arabic*),itemsep=0pt,leftmargin=*,align=left]
\int_step_inline:nn { \l_tnum_int } { \item \seq_item:Nn \l_kor_seq {\seq_item:Nn \l_one_seq { ##1 }}:\quad\u{} }
\end{enumerate}
\newpage
\thispagestyle{answer}
\begin{enumerate}
	\bfseries
	\item[\cfbox{Task~1}] Fill~in~the~blanks~by~choosing~the~English~word~from~the~box~that~matches~its~Korean~meaning.
\end{enumerate}
\fbox{\begin{minipage}{\textwidth}\begin{multicols}{3}\begin{itemize}[label={}]
\seq_map_inline:Nn \l_en_seq { \item ##1 }
\end{itemize}\end{multicols}\vspace*{-0.8em}\end{minipage}}\smallskip\par
\begin{enumerate}[label=(\arabic*),itemsep=0pt,leftmargin=*,align=left]
\int_step_inline:nn { \l_tnum_int } { \item \seq_item:Nn \l_kor_seq {\seq_item:Nn \l_one_seq {##1}}: \quad\u{\textcolor{red}{\seq_item:Nn \l_en_seq {\seq_item:Nn \l_one_seq{##1}}}} }
\end{enumerate}
\newpage
	}



	{2} {
\int_set:Nn \l_tmpa_int {0}
\int_do_while:nn { \l_tmpa_int < \l_tnum_int }
{
	\int_incr:N \l_tmpa_int
	\seq_pop_left:NN {\l_my_seq} {\l_my_tl}
	\tl_set_eq:NN \l_en_tl \l_my_tl
	\tl_set_eq:NN \l_kor_tl \l_my_tl
	\tl_set_eq:NN \l_ensen_tl \l_my_tl
	\tl_set_eq:NN \l_korsen_tl \l_my_tl
	\regex_replace_once:nnN { (.*?)/(.*?)/(.*?)/(.*) } { \1 } \l_en_tl
	\regex_replace_once:nnN { (.*?)/(.*?)/(.*?)/(.*) } { \2 } \l_kor_tl
	\regex_replace_once:nnN { (.*?)/(.*?)/(.*?)/(.*) } { \3 } \l_ensen_tl
	\regex_replace_once:nnN { (.*?)/(.*?)/(.*?)/(.*) } { \4 } \l_korsen_tl
	\tl_set_eq:NN \l_ensenprob_tl \l_ensen_tl
	\tl_set_eq:NN \l_enword_tl \l_ensen_tl
	\regex_replace_once:nnN { \(\w+\) } { \c{u} \cB{ \cE} } \l_ensenprob_tl
	\regex_replace_once:nnN { \((\w+)\) } { \c{u} \cB{ \c{textcolor} \cB{ red \cE} \cB{ \1 \cE} \cE} } \l_ensen_tl
	\regex_replace_once:nnN { .*\((\w+)\).* } { \1 } \l_enword_tl
	\tl_set_eq:NN \l_denword_tl \l_enword_tl
	\tl_set_eq:NN \l_den_tl \l_en_tl
	\regex_replace_once:nnN { \w } { } \l_denword_tl
	\regex_replace_once:nnN { \w } { } \l_den_tl
	\tl_if_eq:NNTF \l_denword_tl \l_den_tl { } { \int_incr:N \l_pdiff_int }
	\seq_push:No \l_pen_seq \l_en_tl
	\seq_push:No \l_pensenans_seq \l_ensen_tl
	\seq_push:No \l_pensen_seq \l_ensenprob_tl
	\seq_push:Nx \l_pkorsen_seq \l_korsen_tl
}
\int_step_inline:nnn {1} {\l_tnum_int} {
	\clist_push:Nn \l_two_clist {##1}
}
\seq_set_from_clist:NN \l_two_seq \l_two_clist
\seq_shuffle:N \l_two_seq
\thispagestyle{test}
\begin{enumerate}
	\bfseries
	\item[\cfbox{Task~2}] Choose~the~best~word~to~complete~each~sentence.~(Change~the~form~if~needed.)
\end{enumerate}
\fbox{\begin{minipage}{\textwidth}\begin{multicols}{3}\begin{itemize}[label={}]
\seq_map_inline:Nn \l_pen_seq { \item ##1 }
\end{itemize}\end{multicols}\vspace*{-0.8em}\end{minipage}}\smallskip\par
*단어~중복~활용~불가능,~형태~변형~\int_use:N \l_pdiff_int 개.~(대소문자~구별~제외)
\begin{enumerate}[label=(\arabic*),itemsep=0pt,leftmargin=*,align=left]
\int_step_inline:nn { \l_tnum_int } { \item \seq_item:Nn \l_pensen_seq {\seq_item:Nn \l_two_seq { ##1 }}}
\end{enumerate}
\newpage
\thispagestyle{answer}
\begin{enumerate}
	\bfseries
	\item[\cfbox{Task~2}] Choose~the~best~word~to~complete~each~sentence.~(Change~the~form~if~needed.)
\end{enumerate}
\fbox{\begin{minipage}{\textwidth}\begin{multicols}{3}\begin{itemize}[label={}]
\seq_map_inline:Nn \l_pen_seq { \item ##1 }
\end{itemize}\end{multicols}\vspace*{-0.8em}\end{minipage}}\smallskip\par
*단어~중복~활용~불가능,~형태~변형~\int_use:N \l_pdiff_int 개.~(대소문자~구별~제외)
\begin{enumerate}[label=(\arabic*),itemsep=0pt,leftmargin=*,align=left]
\int_step_inline:nn { \l_tnum_int } { \item \seq_item:Nn \l_pensenans_seq {\seq_item:Nn \l_two_seq { ##1 }}\\\textcolor{red}{\seq_item:Nn \l_pkorsen_seq {\seq_item:Nn \l_two_seq { ##1 }}}}
\end{enumerate}
\newpage
	}



	{3} {
\int_set:Nn \l_tmpa_int {0}
\int_do_while:nn { \l_tmpa_int < \l_tnum_int }
{
	\int_incr:N \l_tmpa_int
	\seq_pop_left:NN {\l_my_seq} {\l_my_tl}
	\tl_set_eq:NN \l_en_tl \l_my_tl
	\tl_set_eq:NN \l_kor_tl \l_my_tl
	\tl_set_eq:NN \l_ensen_tl \l_my_tl
	\tl_set_eq:NN \l_korsen_tl \l_my_tl
	\regex_replace_once:nnN { (.*?)/(.*?)/(.*?)/(.*) } { \1 } \l_en_tl
	\regex_replace_once:nnN { (.*?)/(.*?)/(.*?)/(.*) } { \2 } \l_kor_tl
	\regex_replace_once:nnN { (.*?)/(.*?)/(.*?)/(.*) } { \3 } \l_ensen_tl
	\regex_replace_once:nnN { (.*?)/(.*?)/(.*?)/(.*) } { \4 } \l_korsen_tl
	\tl_set_eq:NN \l_ensenprob_tl \l_ensen_tl
	\tl_set_eq:NN \l_enword_tl \l_ensen_tl
	\regex_replace_once:nnN { \((\w)\w+\) } { \c{un} \cB{ \1 \cE} } \l_ensenprob_tl
	\regex_replace_once:nnN { \((\w)(\w+)\) } { \c{un} \cB{ \1 \c{textcolor} \cB{ red \cE} \cB{ \2 \cE} \cE} } \l_ensen_tl
	\regex_replace_once:nnN { .*\((\w+)\).* } { \1 } \l_enword_tl
	\tl_set_eq:NN \l_denword_tl \l_enword_tl
	\tl_set_eq:NN \l_den_tl \l_en_tl
	\regex_replace_once:nnN { \w } { } \l_denword_tl
	\regex_replace_once:nnN { \w } { } \l_den_tl
	\tl_if_eq:NNTF \l_denword_tl \l_den_tl { } { \int_incr:N \l_ppdiff_int }
	\seq_push:No \l_ppensenans_seq \l_ensen_tl
	\seq_push:No \l_ppensen_seq \l_ensenprob_tl
	\seq_push:Nx \l_ppkorsen_seq \l_korsen_tl
}
\int_step_inline:nnn {1} {\l_tnum_int} {
	\clist_push:Nn \l_three_clist {##1}
}
\seq_set_from_clist:NN \l_three_seq \l_three_clist
\seq_shuffle:N \l_three_seq

\thispagestyle{test}
\begin{enumerate}
	\bfseries
	\item[\cfbox{Task~3}] Write~down~the~best~word~to~complete~each~sentence,~starting~with~the~given~letter.
\end{enumerate}
*형태~변형~\int_use:N \l_ppdiff_int 개.~(대소문자~구별~제외)
\begin{enumerate}[label=(\arabic*),itemsep=0pt,leftmargin=*,align=left]
\int_step_inline:nn { \l_tnum_int } { \item \seq_item:Nn \l_ppensen_seq {\seq_item:Nn \l_three_seq { ##1 }}\newline\seq_item:Nn \l_ppkorsen_seq {\seq_item:Nn \l_three_seq { ##1 }}}
\end{enumerate}
\newpage
\thispagestyle{answer}
\begin{enumerate}
	\bfseries
	\item[\cfbox{Task~3}] Write~down~the~best~word~to~complete~each~sentence,~starting~with~the~given~letter.
\end{enumerate}
*형태~변형~\int_use:N \l_ppdiff_int 개.~(대소문자~구별~제외)
\begin{enumerate}[label=(\arabic*),itemsep=0pt,leftmargin=*,align=left]
\int_step_inline:nn { \l_tnum_int } { \item \seq_item:Nn \l_ppensenans_seq {\seq_item:Nn \l_three_seq { ##1 }}\\\seq_item:Nn \l_ppkorsen_seq {\seq_item:Nn \l_three_seq { ##1 }}}
\end{enumerate}
\newpage
	}
}

}
