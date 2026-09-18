/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strrchr.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: verosvec <verosvec@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/09/18 21:52:45 by verosvec          #+#    #+#             */
/*   Updated: 2026/09/18 22:12:21 by verosvec         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strrchr(const char *s, int c)
{
	char	ch;
	size_t	i;

	ch = (char)c;
	i = ft_strlen(s) + 1;
	while (i > 0)
	{
		i--;
		if (s[i] == ch)
			return ((char *)&s[i]);
	}
	return (NULL);
}
