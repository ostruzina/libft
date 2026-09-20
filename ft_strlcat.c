/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strlcat.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: verosvec <verosvec@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/09/20 15:17:52 by verosvec          #+#    #+#             */
/*   Updated: 2026/09/20 17:37:41 by verosvec         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

size_t	ft_strlcat(char *dst, const char *src, size_t size)
{
	size_t	srclength;
	size_t	dstlength;
	size_t	i;

	srclength = ft_strlen(src);
	dstlength = ft_strlen(dst);
	if (size == 0)
		return (srclength);
	i = 0;
	if (size <= dstlength)
		return (srclength + size);
	while (src[i] != '\0' && i < size - dstlength - 1)
	{
		dst[dstlength + i] = src[i];
		i++;
	}
	dst[dstlength + i] = '\0';
	return (dstlength + srclength);
}
