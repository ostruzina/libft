/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memcpy.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: verosvec <verosvec@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/09/16 18:40:29 by verosvec          #+#    #+#             */
/*   Updated: 2026/09/17 19:32:38 by verosvec         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	*ft_memcpy(void *dest, const void *src, size_t n)
{
	unsigned char		*udest;
	const unsigned char	*usrc;
	size_t				i;

	if (dest == NULL && src == NULL)
	{
		return (dest);
	}
	udest = (unsigned char *)dest;
	usrc = (const unsigned char *)src;
	i = 0;
	while (i < n)
	{
		udest[i] = usrc[i];
		i++;
	}
	return (dest);
}
