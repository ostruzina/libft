/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strdup.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: verosvec <verosvec@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/09/20 23:00:59 by verosvec          #+#    #+#             */
/*   Updated: 2026/10/05 20:14:39 by verosvec         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

char	*ft_strdup(const char *s)
{
	size_t	slen;
	char	*dup;

	if (!s)
		return (NULL);
	slen = ft_strlen(s);
	dup = malloc(sizeof(char) * (slen + 1));
	if (!dup)
		return (NULL);
	ft_memcpy(dup, s, slen + 1);
	return (dup);
}
